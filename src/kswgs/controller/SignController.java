package kswgs.controller;

import kswgs.model.entity.Sign;
import kswgs.model.entity.User;
import kswgs.model.service.ISignService;
import kswgs.model.service.IUserDetailedService;
import kswgs.utils.Json;
import kswgs.utils.Result;
import kswgs.utils.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Controller
@RequestMapping("/sign")
public class SignController {

    @Resource
    private ISignService signService;

    @Resource
    private IUserDetailedService userDetailedService;

    @RequestMapping("/signDay")
    public void signDay(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Result result = new Result();
        if (user == null) {

            try {
                result.setIsSuccess(false);
                result.setMsg("用户未登录");
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {

            Sign sign = signService.getSignById(user.getUsername());
            //判断为空则为第一次签到，生成一次签到表记录
            if (sign == null) {

                Sign newSign = new Sign();
                //设置签到表id为UUID
                newSign.setSign_id(UUIDUtils.getUUIDReplace());
                newSign.setUser_id(user.getUsername());
                newSign.setSign_count(1);
                newSign.setSign_continue(1);
                newSign.setLast_time(new Date());
                Boolean flag = signService.addNewSignById(newSign);

                if (flag) {
                    try {
                        //第一次签到所得积分为10积分
                        int sign_point = 10;
                        userDetailedService.updatePointBySign(user.getUsername(),sign_point);
                        result.setIsSuccess(true);
                        result.setMsg("签到成功");
                        int old_point= user.getUserDetailed().getPoint();//获取原来的积分
                        result.setData(sign_point+old_point);
                        user.getUserDetailed().setPoint(old_point+sign_point);//更新session中的用户积分
                        session.setAttribute("user",user);
                        Json.toJson(result, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    try {
                        result.setIsSuccess(false);
                        result.setMsg("签到失败，请稍后重新签到");
                        Json.toJson(result, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                //第一次签到 end

                //不为空则进行修改签到表状态
            } else {
                SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
                Date last_time = sign.getLast_time();
                Date now_time = new Date();
                //将现在的时间转化为yyyyMMdd字符串
                String now_day = sf.format(now_time);
                //将最后签到的时间转化为yyyyMMdd字符串
                String last_day = sf.format(last_time);
                //判断今天是不是已签到
                if(last_day.equals(now_day)){
                    try {
                        result.setIsSuccess(true);
                        result.setMsg("今日已签到");
                        Json.toJson(result, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }else{
                    //今日未签到则判断上一次签到日期是否为昨天

                    Calendar calendar = Calendar.getInstance();
                    calendar.add(Calendar.DATE, -1); //得到前一天
                    Date last_date = calendar.getTime();//前一天时间
                    int sign_count = sign.getSign_count();
                    int sign_continue = sign.getSign_continue();
                    //判断上一次签到时间是否为昨天
                    if(last_day.equals(sf.format(last_date))){
                        sign_continue++;
                    }else{
                        sign_continue = 1;
                    }
                    sign_count++;
                    /*sign.setSign_count(sign_count+1);
                    sign.setSign_continue(sign_continue+1);
                    sign.setLast_time(now_time);*/

                    signService.updateSignById(user.getUsername(),sign_count,sign_continue,now_time);
                    try {
                        //连续签到积分为10积分加连续签到次数*2
                        int sign_point = 10+(sign_continue-1)*2;
                        int old_point= user.getUserDetailed().getPoint();//获取原来的积分
                        userDetailedService.updatePointBySign(user.getUsername(),sign_point);
                        result.setIsSuccess(true);
                        result.setMsg("今日签到成功");
                        result.setData(sign_point+old_point);
                        user.getUserDetailed().setPoint(old_point+sign_point);//更新session中的用户积分
                        session.setAttribute("user",user);
                        Json.toJson(result, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

            }
        }


    }


    //判断今天是否已签到
    @RequestMapping("isExistSignByDay")
    public void isExistSignByDay(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        Sign sign = signService.getSignById(user.getUsername());
        Result result = new Result();
        if(sign == null){
            try {
                result.setIsSuccess(false);
                result.setMsg("用户无签到表记录");
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
            Date last_time = sign.getLast_time();
            Date nowTime = new Date();
            //将现在的时间转化为yyyyMMdd字符串
            String nowDay = sf.format(nowTime);
            //将最后签到的时间转化为yyyyMMdd字符串
            String last_day = sf.format(last_time);
            //判断今天是不是已签到
            if(last_day.equals(nowDay)){
                try {
                    result.setIsSuccess(true);
                    result.setMsg("今日已签到");
                    Json.toJson(result, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else{
                try {
                    result.setIsSuccess(false);
                    result.setMsg("今日未签到");
                    Json.toJson(result, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
