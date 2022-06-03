package com.induk.bucketlist.util;

import com.induk.bucketlist.dto.UploadFile;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class FileStore {

    private String path = System.getProperty("user.dir");
    private String fileDir = path + "\\src\\main\\resources\\static\\images\\";
    private String fileDir_U = path + "\\out\\production\\resources\\static\\images\\";
    private String storeFilename = "";
    public String getFullPath(String directory, String filename) {
        return fileDir + directory + "\\" + filename;
    }

    public String getFullPath_U(String directory, String filename) {
        return fileDir_U + directory + "\\" + filename;
    }

    public List<UploadFile> storeFiles(List<MultipartFile> multipartFiles, String directory) throws IOException {
        List<UploadFile> storeFileResult = new ArrayList<>();

        for (MultipartFile multipartFile : multipartFiles) {
            if(!multipartFile.isEmpty()) {
                storeFileResult.add(storeFile(multipartFile, directory));
            }
        }

        return storeFileResult;
    }

    public UploadFile storeFile(MultipartFile multipartFile, String directory) throws IOException {
        if(multipartFile.isEmpty()) {
            return null;
        }

        String originalFilename = multipartFile.getOriginalFilename();
        storeFilename = createStoreFilename(originalFilename);
        multipartFile.transferTo(new File(getFullPath(directory, storeFilename)));

        return new UploadFile(originalFilename, storeFilename, directory);
    }

    public UploadFile storeFile_U(MultipartFile multipartFile, String directory) throws IOException {
        if(multipartFile.isEmpty()) {
            return null;
        }
        
        String originalFilename = multipartFile.getOriginalFilename();
        storeFilename = createStoreFilename(originalFilename);

        File file = new File(getFullPath_U(directory, storeFilename));
        multipartFile.transferTo(file);

        return new UploadFile(originalFilename, storeFilename, directory);
    }

    private String createStoreFilename(String originFilename) {
        // 서버에 저장하는 랜덤 파일명 만들기
        String uuid = UUID.randomUUID().toString();
        String ext = extractExt(originFilename);
        return uuid + "." + ext;
    }

    private String extractExt(String originFilename) {
        // imageForm.jpg -> . 의 위치 가져오기
        int pos = originFilename.lastIndexOf(".");

        // 위치 + 1 에서 확장자만 리턴
        return originFilename.substring(pos + 1);
    }
}
