package kswgs.controller;

import kswgs.model.entity.Notice;
import kswgs.model.service.INoticeService;
import kswgs.utils.Json;
import kswgs.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Resource
    private INoticeService noticeService;

    @RequestMapping("/getNoticeByNewTime")
    public void getNoticeByNewTime(HttpServletRequest request, HttpServletResponse response){
        String count = request.getParameter("count");//获取需要多少条最新的公告
        int c = Integer.parseInt(count);
        System.out.println("coun");
        ArrayList<Notice> list = noticeService.getNoticeByNewTime(Integer.parseInt(count));
        System.out.println("list=="+list);
        Result result = new Result();
        if(list != null){
            result.setIsSuccess(true);
            result.setMsg("获取公告成功");
            result.setData(list);
        }else{
            result.setIsSuccess(false);
            result.setMsg("获取公告失败");
        }
        try {
            Json.toJson(result,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
