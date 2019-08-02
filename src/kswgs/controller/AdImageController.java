package kswgs.controller;

import kswgs.model.service.IAdImageService;
import kswgs.utils.Json;
import kswgs.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequestMapping("/adImage")
public class AdImageController {

    @Resource
    private IAdImageService adImageService;


    @RequestMapping("/adImageShow")
    public void adImageShow(HttpServletRequest request, HttpServletResponse response){
        ArrayList list = adImageService.getAdImage();
        Result result = new Result();
        if(list != null){
            result.setIsSuccess(true);
            result.setMsg("轮播图获取成功");
            result.setData(list);
        }else {
            result.setIsSuccess(true);
            result.setMsg("轮播图获取成功");
        }
        try {
            Json.toJson(result,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
