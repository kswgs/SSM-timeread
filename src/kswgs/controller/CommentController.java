package kswgs.controller;

import kswgs.model.entity.Comment;
import kswgs.model.entity.User;
import kswgs.model.service.ICommentService;
import kswgs.model.service.IUserService;
import kswgs.utils.Json;
import kswgs.utils.Result;
import kswgs.utils.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Resource
    private IUserService userService;

    @Resource
    private ICommentService commentService;

    @RequestMapping("/addComment")
    public void addComment(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String comment_id = UUIDUtils.getUUIDReplace();
        String content = request.getParameter("content");
        String book_id = request.getParameter("book_id");
        Date comment_time = new Date();
        Boolean flag = commentService.addCommentByUser(comment_id,content,user.getUsername(),comment_time,book_id);
        Result result = new Result();
        if(flag){
            result.setIsSuccess(true);
            result.setMsg("评论成功");
        }else{
            result.setIsSuccess(false);
            result.setMsg("评论失败");
        }
        try {
            Json.toJson(result,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getCommentByBookId")
    public void getCommentByBookId(HttpServletRequest request, HttpServletResponse response){
        String book_id = request.getParameter("book_id");
        ArrayList<Comment> list = commentService.getCommentByBookId(book_id);
        Result result = new Result();
        if(list == null){
            result.setIsSuccess(false);
            result.setMsg("评论获取失败");
        }else {
            result.setIsSuccess(true);
            result.setMsg("评论获取成功");
            result.setData(list);
        }
        try {
            Json.toJson(result,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
