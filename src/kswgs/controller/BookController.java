package kswgs.controller;

import kswgs.model.entity.*;
import kswgs.model.service.*;
import kswgs.utils.Json;
import kswgs.utils.Result;
import kswgs.utils.UUIDUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/book")
public class BookController {

    @Resource
    private IBookService bookService;

    @Resource
    private IBookFileService bookFileService;

    @Resource
    private ICategoryService categoryService;

    @Resource
    private IShoppingItemService shoppingItemService;

    @Resource
    private IUserDetailedService userDetailedService;

    //图片存储路径
    String imgPath = "D:\\TimeRead_BookImg";
    //图书文件存储路径
    String filePath = "D:\\TimeRead_BookFile";

    //因为读取本地的图片和文件，tomcat已设置虚拟路径，所以存入数据库中的路径名不包含D:
    //存入数据库中的路径
    String imgPathShow = "\\TimeRead_BookImg";
    String filePathShow = "\\TimeRead_BookFile";

    @RequestMapping("/uploadBookFile")
    @ResponseBody
    public JSONObject uploadBookFile(HttpServletRequest request, MultipartFile file) {

        JSONObject jsonObject = new JSONObject();
        JSONObject fileMsg = new JSONObject();

        if (file.isEmpty()) {
            jsonObject.put("msg", "文件不能为空");
            jsonObject.put("code", 1);//1为上传失败，0为成功
            return jsonObject;
        }
        try {
            //String filePath = "D:\\TimeRead_BookFile";

            //获取文件大小，单位为byte
            long oriFileSize = file.getSize();
            double fileSize = (double) oriFileSize / 1024;

            // 获取原文件名
            String oriName = file.getOriginalFilename();
            // 获取原文件后缀，包括.
            String oriName_suffix = oriName.substring(oriName.lastIndexOf("."));
            //获取原文件后缀，不包括.
            String fileFormat = oriName.substring(oriName.lastIndexOf(".") + 1);
            //设置图文件的UUID名即保存后的文件名
            String fileName = UUIDUtils.getUUID() + oriName_suffix;
            File uploadFile = new File(filePath + "\\" + fileName);
            file.transferTo(uploadFile);

            //设图书的文件名为保存的文件名加后缀
            String bookFilename = fileName + "." + fileFormat;

            jsonObject.put("code", 0);//1为上传失败，0为成功
            jsonObject.put("msg", "上传成功");
            //将图书的文件名设上传时的文件名，乱码，暂时不用
            //fileMsg.put("oriName", oriName);
            //将图书的文件名为保存的文件名加后缀
            fileMsg.put("oriName", bookFilename);
            fileMsg.put("fileName", fileName);
            fileMsg.put("fileFormat", fileFormat);
            if (fileSize < 1024) {
                fileMsg.put("fileSize", String.format("%.2f", fileSize) + "kb");
            } else {
                fileMsg.put("fileSize", String.format("%.2f", fileSize / 1024) + "mb");
            }
            jsonObject.put("data", fileMsg);
            //System.out.println("上传前fileMsg"+fileMsg);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return jsonObject;
    }

    @RequestMapping("/uploadBookImg")
    @ResponseBody
    public JSONObject uploadBookImg(HttpServletRequest request, MultipartFile file) {

        JSONObject jsonObject = new JSONObject();
        JSONObject imgMsg = new JSONObject();

        try {
            // 获取原文件名
            String oriName = file.getOriginalFilename();
            //System.out.println("oriName:" + oriName);
            // 获取原文件图片后缀，包括.
            String oriName_suffix = oriName.substring(oriName.lastIndexOf("."));
            //System.out.println("oriName_suffix:"+oriName_suffix);
            //获取原文件图片后缀，不包括.
            String imgFormat = oriName.substring(oriName.lastIndexOf(".") + 1);
            // System.out.println("oriName_suffix2:"+oriName_suffix2);
            //设置图片的UUID名即保存后的图片名
            String imgName = UUIDUtils.getUUID() + oriName_suffix;
            //String imgPath = "D:\\TimeRead_BookImg";
            File uploadFile = new File(imgPath + "\\" + imgName);

            file.transferTo(uploadFile);

            jsonObject.put("code", 0);
            jsonObject.put("msg", "图片上传成功");
            imgMsg.put("imgName", imgName);
            imgMsg.put("imgFormat", imgFormat);
            jsonObject.put("data", imgMsg);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return jsonObject;
    }

    @RequestMapping("/categoryParent")
    @ResponseBody
    public void getCategoryParent(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Category> list = categoryService.getCategoryParent();
        try {
            Result result = new Result(true, 0, list);
            Json.toJson(result, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/category")
    @ResponseBody
    public void getCategory(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Category> list = categoryService.getCategory();
        try {
            Result result = new Result(true, 0, list);
            Json.toJson(result, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/isExistBookName")
    @ResponseBody
    public void isExistBookName(HttpServletRequest request, HttpServletResponse response) {
        String bookname = request.getParameter("bookname");
        /*判断输入的信息是否已存在*/
        if (bookService.isExistBookName(bookname)) {
            try {
                Result result = new Result(true, 0, "图书已存在", null);
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

    //添加图书
    @RequestMapping("/addBook")
    public void addBook(HttpServletRequest request, HttpServletResponse response) {

        Book book = new Book();
        //将图书ID设为UUID
        String book_id = UUIDUtils.getUUIDReplace();
        String imgMsg = request.getParameter("imgMsg");
        String bookFileMsg = request.getParameter("bookFileMsg");
        if (imgMsg.equals("") && bookFileMsg.equals("")) {
            try {
                Result result = new Result(false, "图片或文件未上传");
                Json.toJson(result, response);
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        JSONObject jsonImgMsg = JSONObject.fromObject(imgMsg);
        //System.out.println("bookFileMsg="+bookFileMsg);
        JSONArray jsonBookFileMsg = JSONArray.fromObject(bookFileMsg);
        //System.out.println("imgMsg=="+imgMsg);
        //System.out.println("bookFileMsg==" + bookFileMsg);
        String bookname = request.getParameter("bookname");
        String author = request.getParameter("author");
        String bookpoint = request.getParameter("bookpoint");
        String introduction = request.getParameter("introduction");
        String bookCategoryParent = request.getParameter("bookCategoryParent");
        String bookCategory = request.getParameter("bookCategory");
        book.setBook_id(book_id);
        book.setName(bookname);
        book.setAuthor(author);
        book.setBook_point(Integer.parseInt(bookpoint));
        book.setIntroduction(introduction);
        book.setCategory(bookCategory);
        book.setCategory_parent(bookCategoryParent);
        book.setUpload_time(new Date());
        book.setImage(imgPathShow + "\\" + jsonImgMsg.getString("imgName"));
        Boolean flagBook = bookService.addBook(book);
        int flagBookFileCount = 0;
        if (flagBook) {
            for (int i = 0; i < jsonBookFileMsg.size(); i++) {
                BookFile bookFile = new BookFile();
                JSONObject json = jsonBookFileMsg.getJSONObject(i);
                //设置图书文件id
                String book_file_id = UUIDUtils.getUUIDReplace();
                bookFile.setBook_file_id(book_file_id);
                bookFile.setBook_id(book_id);
                bookFile.setFile_name(json.getString("oriName"));
                bookFile.setFile_type(json.getString("fileFormat"));
                bookFile.setFile_size(json.getString("fileSize"));
                bookFile.setPath(filePathShow + "\\" + json.getString("fileName"));
                Boolean flagBookFile = bookFileService.addBookFile(bookFile);
                if (flagBookFile) {
                    flagBookFileCount++;
                }
            }
        }
        try {
            Result result = new Result();
            if (flagBook && flagBookFileCount == jsonBookFileMsg.size()) {
                result.setIsSuccess(true);
            } else {
                result.setIsSuccess(false);
                result.setMsg("文件上传失败");
            }
            Json.toJson(result, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }


    @RequestMapping("/getNewBook")
    public void getNewBook(HttpServletRequest request, HttpServletResponse response) {
        String count = request.getParameter("count");
        String category = request.getParameter("category");
        String categoryParent = request.getParameter("categoryParent");
        //System.out.println("category=="+category);
        //System.out.println("categoryParent=="+categoryParent);
        //System.out.println("count"+count);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("count", Integer.parseInt(count));
        if (category.equals("0") || category.equals("")) {
            map.put("category", null);
        } else {
            map.put("category", category);
        }
        if (categoryParent.equals("0") || categoryParent.equals("")) {
            map.put("categoryParent", null);
        } else {
            map.put("categoryParent", categoryParent);
        }
        //System.out.println("map=="+map);
        ArrayList<Book> list = bookService.getNewBook(map);
        //System.out.println("list:"+list);
        // HttpSession session = request.getSession();
        Result result = new Result();
        if (categoryParent.equals("0") && category.equals("0")) {
            //session.setAttribute("newBook", list);
            result.setIsSuccess(true);
            result.setMsg("无分类的最新图书加载成功");
            result.setData(list);
        } else if (categoryParent.equals("0") && !category.equals("0")) {
            //session.setAttribute("newBook" + "_" + categoryParent, list);
            result.setIsSuccess(true);
            result.setMsg("只有分类的图书加载成功");
            result.setData(list);
        }else if (!categoryParent.equals("0") && category.equals("0")) {
            //session.setAttribute("newBook" + "_" + categoryParent + "_" + category, list);
            result.setIsSuccess(true);
            result.setMsg("只有类型的图书加载成功");
            result.setData(list);
        }  else if (!categoryParent.equals("0") && !category.equals("0")) {
            //session.setAttribute("newBook" + "_" + categoryParent + "_" + category, list);
            result.setIsSuccess(true);
            result.setMsg("有分类、类型的图书加载成功");
            result.setData(list);
        } else {
            result.setIsSuccess(false);
            result.setMsg("图书加载失败");
        }
        try {
            Json.toJson(result, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @RequestMapping("/getBookByIdDetailed")
    public ModelAndView getBookByIdDetailed(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        String book_id = request.getParameter("book_id");
        Book book = bookService.getBookById(book_id);
        book.setBookFile(bookFileService.getBookFileById(book_id));
        String bookCategoryParent = categoryService.getCategoryParentById(book.getCategory_parent());
        String bookCategory = categoryService.getCategoryById(book.getCategory());
        //System.out.println(book);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ShoppingItem shoppingItem;
        if (user == null) {
            shoppingItem = null;
        } else {
            shoppingItem = shoppingItemService.getShoppingItemByUseIdAndBookId(book_id, user.getUsername());
        }


        //System.out.println("shoppingItem==" + shoppingItem);
        session.setAttribute("shoppingItem", shoppingItem);
        session.setAttribute("bookCategoryParent", bookCategoryParent);
        session.setAttribute("bookCategory", bookCategory);
        session.setAttribute("bookDetailed", book);


        mv.setViewName("book");
        return mv;
    }

    @RequestMapping("/shoppingBook")
    public void shoppingBook(HttpServletRequest request, HttpServletResponse response) {

        String book_id = request.getParameter("book_id");
        String user_id = request.getParameter("user_id");
        int book_point = Integer.parseInt(request.getParameter("book_point"));

        HttpSession session = request.getSession();

        Result result = new Result();
        User user = (User) session.getAttribute("user");
        int user_point = user.getUserDetailed().getPoint();
        if(user_point - book_point < 0){
            result.setIsSuccess(false);
            result.setMsg("积分不足");
            try {
                Json.toJson(result, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;

        }
        Boolean userDetailedFlag = userDetailedService.updatePointById(user_id, book_point);
        if (userDetailedFlag) {
            ShoppingItem shoppingItem = new ShoppingItem();
            shoppingItem.setShopping_id(UUIDUtils.getUUIDReplace());
            shoppingItem.setBook_id(book_id);
            shoppingItem.setUser_id(user_id);
            shoppingItem.setPoint(book_point);
            shoppingItem.setTime(new Date());
            Boolean itemFlag = shoppingItemService.addShoppingItem(shoppingItem);
            if (itemFlag) {

                user.getUserDetailed().setPoint(user_point - book_point);
                session.setAttribute("user", user);
                session.setAttribute("shoppingItem", shoppingItem);

                result.setIsSuccess(true);
                result.setMsg("购买成功");
            } else {
                result.setIsSuccess(false);
                result.setMsg("购买失败");
            }
        }
        try {
            Json.toJson(result, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @RequestMapping("/getBookByCategory")
    public ModelAndView getBookByCategory(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        int page = Integer.parseInt(request.getParameter("page"));
        int count = 6;//分类页面显示的是6本
        int start = (page - 1) * count;
        int end = page * count;
        String category = request.getParameter("category");
        String categoryParent = request.getParameter("categoryParent");

        session.setAttribute("bookCategory", category);
        session.setAttribute("bookCategoryParent", categoryParent);

        String bookCategory;
        String bookCategoryParent;
        String categoryCount = category;
        String categoryParentCount = categoryParent;

        //以下两个if为判断传入的category和categoryParent是否为0，为0则是设置为null，查询最新的图书
        //否则是查询相应的分类图书
        if (category.equals("0")) {
            category = null;
            bookCategory = null;
            categoryCount = null;
        } else {
            bookCategory = categoryService.getCategoryById(category);
        }
        if (categoryParent.equals("0")) {
            categoryParent = null;
            bookCategoryParent = null;
            categoryParentCount = null;
        } else {
            bookCategoryParent = categoryService.getCategoryParentById(categoryParent);
        }

        //获取相应分类图书的总数量
        int bookCount = bookService.getBookCount(categoryCount, categoryParentCount);
        int pageEnd = bookCount / 6;
        ArrayList<Book> list = bookService.selectBookByCategory(start, end, category, categoryParent);

        session.setAttribute("bookInfoList", list);
        session.setAttribute("bookCategoryParentName", bookCategoryParent);
        session.setAttribute("bookCategoryName", bookCategory);
        session.setAttribute("page", page);
        session.setAttribute("pageEnd", pageEnd);
        //session.setAttribute("pageEnd_page", pageEnd-page);

        mv.setViewName("category");

        return mv;

    }


    @RequestMapping("/getBookByRandom")
    public void getBookByRandom(HttpServletRequest request, HttpServletResponse response){
        int count = Integer.parseInt(request.getParameter("count"));
        ArrayList<Book> list = bookService.getBookByRandom(count);
        Result result = new Result();
        if(list != null){
            result.setIsSuccess(true);
            result.setMsg("随机图书获取成功");
            result.setData(list);
        }else {
            result.setIsSuccess(true);
            result.setMsg("随机图书获取失败");
        }
        try {
            Json.toJson(result,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
