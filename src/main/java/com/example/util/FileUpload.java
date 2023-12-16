package com.example.util;

import com.example.board.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024; // 15MB

        String realPath = request.getServletContext().getRealPath("resource/img");

        File dir = new File(realPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        BoardVO one = new BoardVO();
        try {
            MultipartRequest multipartRequest = new MultipartRequest(
                    request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()
            );

            filename = request.getContextPath() + "/img/" + multipartRequest.getFilesystemName("image_url");

            // Extracting data from the form and setting it to BoardVO
            one.setSeller_id(multipartRequest.getParameter("seller_id"));
            one.setPw(multipartRequest.getParameter("pw"));
            one.setNickname(multipartRequest.getParameter("nickname"));
            one.setProductName(multipartRequest.getParameter("productName"));
            one.setDescription(multipartRequest.getParameter("description"));
            one.setLocation(multipartRequest.getParameter("location"));
            one.setImage_url(filename);
            one.setProd_condition(multipartRequest.getParameter("prod_condition"));

            // Parsing and setting price if available
            String priceStr = multipartRequest.getParameter("price");
            if (priceStr != null && !priceStr.isEmpty()) {
                try {
                    int price = Integer.parseInt(priceStr);
                    one.setPrice(price); // Assuming BoardVO has a price field
                } catch (NumberFormatException e) {
                    System.out.println("Invalid price format: " + priceStr);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error during file upload: " + e.getMessage());
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("resource/img");
        File f = new File(filePath + "/" + filename);
        if (f.exists()) {
            f.delete();
        } else {
            System.out.println("File does not exist: " + filename);
        }
    }
}
