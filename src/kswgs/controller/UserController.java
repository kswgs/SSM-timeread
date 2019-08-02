package kswgs.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import kswgs.model.entity.BackUser;
import kswgs.model.entity.User;
import kswgs.model.service.IBackUserService;
import kswgs.model.service.IUserDetailedService;
import kswgs.model.service.IUserService;
import kswgs.utils.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @Resource
    private IUserDetailedService userDetailedService;

    @Resource
    private IBackUserService backUserService;

    //用户名登录
    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.getUserByUsername(username);
        HttpSession session = request.getSession();
        try {
            int userActivate = user.getUserDetailed().getActivate();
            if (userActivate == 0) {
                session.setAttribute("loginerror", "账号未激活");
                mv.setViewName("login");
            } else {
                if (password.equals(user.getPassword())) {
                    //mv.addObject("user", user);
                    session.removeAttribute("loginerror");
                    session.setAttribute("user", user);
                    mv.setViewName("index");
                } else {
                    //mv.addObject("loginerror","账号或密码错误");
                    session.setAttribute("loginerror", "账号或密码错误");
                    mv.setViewName("login");
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    @RequestMapping("/indexLogin")
    public ModelAndView indexLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        User user = userService.getUserByUsername(username);
        try {
            if (user.getUserDetailed().getActivate() == 0) {
                session.setAttribute("loginerror", "账号未激活");
                mv.setViewName("login");
            } else {

                if (password.equals(user.getPassword())) {
                    //mv.addObject("user", user);
                    session.removeAttribute("loginerror");
                    session.setAttribute("user", user);
                } else {
                    //mv.addObject("loginerror","账号或密码错误");
                    session.setAttribute("loginerror", "账号或密码错误");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("index");
        return mv;
    }

    /*注销用户*/
    @RequestMapping("/cancel")
    public ModelAndView cancel(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        //mv.addObject("user",null);
        session.setAttribute("user", null);
        mv.setViewName("index");
        return mv;
    }

    //后台查询所有用户信息
    @RequestMapping("/selectByUserDetailed")
    // @ResponseBody
    public void selectByUserDetailed(HttpServletRequest request, HttpServletResponse response) {
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        int start = --page * limit;
        ArrayList<User> list = userService.getByUser(start, limit);
        //转换生日的Date格式为字符串
        //DateFormat formatBirthday = new SimpleDateFormat("MM-dd");
        //转换注册时间的Date格式为字符串
        //DateFormat formatRegister = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");


        try {
            Result result = new Result(true, 0, "", userService.getUserCount(), list);
            Json.toJson(result, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /*JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        for(int i=0;i<list.size();i++){
            JSONObject jsonUser = new JSONObject();
            jsonUser.put("id",start+i+1);
            jsonUser.put("username",list.get(i).getUsername());
            jsonUser.put("email",list.get(i).getEmail());
            if(list.get(i).getUserDetailed().getGender().equals("0")){
                jsonUser.put("gender","男");
            }else if(list.get(i).getUserDetailed().getGender().equals("1")){
                jsonUser.put("gender","女");
            }else{
                jsonUser.put("gender","保密");
            }
            jsonUser.put("birthday",formatBirthday.format(list.get(i).getUserDetailed().getBirthday()));
            jsonUser.put("registration_time",formatRegister.format(list.get(i).getUserDetailed().getRegistration_time()));
            jsonUser.put("point",list.get(i).getUserDetailed().getPoint());
            jsonArray.add(jsonUser);
        }
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        //count表示总共多少条数据
        jsonObject.put("count",userService.getUserCount());
        jsonObject.put("data",jsonArray);*/

        // return jsonObject;
    }

    @RequestMapping("/selectByAllUser")
    @ResponseBody
    public JSONObject selectByAllUser() {
        ArrayList<User> list = userService.getByAllUser();

        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        for (int i = 1; i < list.size(); i++) {
            JSONObject jsonUser = new JSONObject();
            jsonUser.put("username", list.get(i).getUsername());
            jsonUser.put("email", list.get(i).getEmail());
            jsonArray.add(jsonUser);
        }
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        System.out.println(jsonObject);

        return jsonObject;
    }

    //判断用户名是否存在
    @RequestMapping("/isExistUsername")
    public void isExistUsername(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        /*判断输入的信息是否已存在*/
        if (userService.isExistUsername(username)) {
            try {
                Result result = new Result(true, 0, "账号已存在", null);
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        } else {
            /*必须返回状态为false，否则json接收会报错*/
            try {
                Result result = new Result(false);
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    //判断邮箱是否存在
    @RequestMapping("/isExistEmail")
    public void isExistEmail(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        if (userService.isExistEmail(email)) {
            try {
                Result result = new Result(true, 0, "邮箱已存在", null);
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        } else {
            try {
                Result result = new Result(false);
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //注册，由dao层添加detailed表没有填的信息，在此处插入一个激活码信息
    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        Date registration_time = new Date();
        // SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        //设置激活码，邮箱加当前时间，并进行md5加密
        String activate_code = MD5Utils.md5(email + System.currentTimeMillis());
        Boolean result = userService.addUser(user);
        Boolean result2 = userDetailedService.addUserDetailed(username, registration_time, activate_code);
        if (result && result2) {
            try {
                MailUtils.activateMail(userService.getUserActivate(username));
            } catch (MessagingException e) {
                e.printStackTrace();
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
        request.getSession().setAttribute("register_email", email);
        mv.setViewName("register_email");

        return mv;
    }


    //点击激活链接后调用的方法
    @RequestMapping("/activatemail")
    public ModelAndView activateMail(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        //获取激活参数
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String token = request.getParameter("token");

        User user = userService.getUserActivate(username);

        if (user.getUserDetailed().getActivate_code().equals(token)) {
            //成功则修改激活状态为1，激活码变成1
            userDetailedService.updateUserActivate(username, 1, "1");
            request.getSession().removeAttribute("register_email");
            mv.setViewName("email_success");
        } else {
            try {
                //设置激活码，邮箱加当前时间，并进行md5加密
                String activate_code = MD5Utils.md5(email + System.currentTimeMillis());
                //失败则修改激活状态为0，激活码重新设置并重新发送激活邮件
                userDetailedService.updateUserActivate(username, 0, activate_code);
                MailUtils.activateMail(userService.getUserActivate(username));
            } catch (MessagingException e) {
                e.printStackTrace();
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
            mv.setViewName("email_error");
        }


        return mv;
    }

    @RequestMapping("/sendMailByPassword")
    public ModelAndView sendMailByPassword(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("email");
        User user = userService.getUserByEmail(email);
        if (user == null) {
            request.getSession().setAttribute("change_password_email_error", "邮箱没有注册用户，请输入正确邮箱");
            mv.setViewName("change_password");
        } else {
            try {
                MailUtils.activateMailByPassword(user);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            request.getSession().removeAttribute("change_password_email_error");
            request.getSession().setAttribute("change_password_email", email);
            mv.setViewName("change_password_email");
        }
        return mv;
    }

    //点击重置密码激活链接后调用的方法
    @RequestMapping("/activateMailByPassword")
    public ModelAndView activateMailByPassword(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        //获取激活参数
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        User user = userService.getUserByEmail(email);

        Boolean flag = userService.updatePasswordById(user.getUsername(), "123456");
        if (flag) {
            request.getSession().removeAttribute("change_password_email");
            mv.setViewName("change_password_success");
        } else {
            try {
                MailUtils.activateMailByPassword(user);
                mv.setViewName("change_password_error");
            } catch (MessagingException e) {
                e.printStackTrace();
            }

        }
        return mv;
    }


    @RequestMapping("/modifyUserInfo")
    public void modifyUserInfo(HttpServletRequest request, HttpServletResponse response) {
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String user_id = request.getParameter("user_id");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Result result = new Result();
        try {
            Boolean flag = userDetailedService.updateUserInfoById(user_id, gender, df.parse(birthday));
            if (flag) {
                result.setIsSuccess(true);
                result.setMsg("修改成功");
            } else {
                result.setIsSuccess(false);
                result.setMsg("修改失败");
            }
            Json.toJson(result, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/modifyPasswordById")
    public void modifyPasswordById(HttpServletRequest request, HttpServletResponse response) {
        String user_id = request.getParameter("user_id");
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        System.out.println("old_password" + old_password);
        System.out.println("new_password" + new_password);
        String password = userService.getPasswordById(user_id);
        Result result = new Result();
        if (password.equals(old_password)) {
            Boolean flag = userService.updatePasswordById(user_id, new_password);
            if (flag) {
                try {
                    result.setIsSuccess(true);
                    result.setMsg("密码修改成功");
                    Json.toJson(result, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    result.setIsSuccess(false);
                    result.setMsg("密码修改失败");
                    Json.toJson(result, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            try {
                result.setIsSuccess(false);
                result.setMsg("旧密码输入不正确");
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    @RequestMapping("/modifyHeadImgById")
    @ResponseBody
    public JSONObject modifyHeadImgById(HttpServletRequest request, HttpServletResponse response, MultipartFile file) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String image_path = "\\TimeRead_headImg\\";
        //Result result = new Result();
        JSONObject jsonObject = new JSONObject();
        try {
            // 获取原文件名
            String oriName = file.getOriginalFilename();
            // 获取原文件图片后缀，包括.
            String oriName_suffix = oriName.substring(oriName.lastIndexOf("."));
            //设置图片的UUID名即保存后的图片名
            String imgName = user.getUsername() + oriName_suffix;
            File uploadFile = new File(image_path + imgName);
            file.transferTo(uploadFile);
            Boolean flag = userDetailedService.updateUserHeadImgById(user.getUsername(), image_path + imgName);
            if (flag) {
                String imagePath = image_path + imgName;
                jsonObject.put("isSuccess", true);
                jsonObject.put("msg", "头像修改成功");
                jsonObject.put("imagePath", imagePath);
                user.getUserDetailed().setImage_path(imagePath);
                session.setAttribute("user", user);
                return jsonObject;
            } else {
                jsonObject.put("isSuccess", false);
                jsonObject.put("msg", "头像修改失败");
                return jsonObject;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/backLogin")
    public void backLogin(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        BackUser backUser = backUserService.getBackUserByUsername(username);
        Result result = new Result();
        if (backUser !=null){
            if(backUser.getPassword().equals(password)){
                result.setIsSuccess(true);
                result.setMsg("登陆成功");
                request.getSession().setAttribute("backUser",backUser);
            }else {
                result.setIsSuccess(false);
                result.setMsg("账户或密码错误");
            }
        }else {
            result.setIsSuccess(false);
            result.setMsg("账户或密码错误");
        }
        try {
            Json.toJson(result,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*注销用户*/
    @RequestMapping("/cancelBackUser")
    public void cancelBackUser(HttpServletRequest request , HttpServletResponse response) {
        Result result = new Result();
        request.getSession().removeAttribute("backUser");
        result.setIsSuccess(true);
        result.setMsg("注销成功");
        try {
            Json.toJson(result,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
