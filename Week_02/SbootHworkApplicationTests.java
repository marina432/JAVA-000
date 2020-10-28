package com.geekbang.sboothwork;

import com.alibaba.fastjson.JSON;
import okhttp3.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.client.RestTemplate;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

@SpringBootTest
class SbootHworkApplicationTests {

    private static final Logger logger = LoggerFactory.getLogger(SbootHworkApplicationTests.class);
    private static final String BASE_URL = "http://10.100.19.202:96";

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private OkHttpClient okHttpClient;


    @Test
    void testRpcByRestTemplate() {
        String uri = "/sdc/mdsp/el/v1/staffInfoSpecified";
        String url = String.format("%s%s", BASE_URL, uri);
        Map<String, Object> paraMap = new HashMap<>();
        paraMap.put("emplid", "10001730");

        Map<String, Object> resultMap = restTemplate.postForObject(url, paraMap, Map.class);
        logger.info(JSON.toJSONString(resultMap));

    }

    @Test
    void testRpcByOkHttp() {
        String url = String.format("%s%s", BASE_URL, "/sdc/mdsp/el/v1/staffInfoSpecified");

        Map<String, Object> paraMap = new HashMap<>();

        paraMap.put("emplid", "10001730");
        RequestBody rBody = RequestBody.create(JSON.toJSONString(paraMap), MediaType.parse("application/json;charset=utf-8"));
        Request request = new Request.Builder()
                .url(url)
                .post(rBody)
                .build();

        try {
            Response response = okHttpClient.newCall(request).execute();
            if(response.isSuccessful()) {
                logger.info(response.body().string());
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Test
    void testRpcByHttpClient() {
        String url = String.format("%s%s", BASE_URL, "/sdc/mdsp/el/v1/staffInfoSpecified");
        HttpPost httpPost = new HttpPost(url);
        httpPost.setHeader("Content-Type", "application/json;charset=utf-8");
        Map<String, String> paraMap = new HashMap<>();
        paraMap.put("emplid", "10001730");
        try {
            httpPost.setEntity(new StringEntity(JSON.toJSONString(paraMap), "utf-8"));
            CloseableHttpClient httpClient = HttpClientBuilder.create().build();
            CloseableHttpResponse response = httpClient.execute(httpPost);
            BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String str = null;
            while ((str = br.readLine()) != null) {
                System.out.println(str);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
