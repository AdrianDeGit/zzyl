package com.zzyl.web;

import com.huaweicloud.sdk.core.exception.ConnectionException;
import com.huaweicloud.sdk.core.exception.RequestTimeoutException;
import com.huaweicloud.sdk.core.exception.ServiceResponseException;
import com.huaweicloud.sdk.iotda.v5.IoTDAClient;
import com.huaweicloud.sdk.iotda.v5.model.ListProductsRequest;
import com.huaweicloud.sdk.iotda.v5.model.ListProductsResponse;
import com.huaweicloud.sdk.iotda.v5.model.ProductSummary;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class IoTDeviceTest {
    @Autowired
    private IoTDAClient ioTDAClient;

    /**
     * 测试查询产品列表接口
     * 该方法通过IoTDA服务客户端向平台发送产品列表查询请求，并处理响应结果
     */
    @Test
    public void selectProduceList() {
        // 创建产品列表查询请求对象
        ListProductsRequest request = new ListProductsRequest();

        try {
            // 调用IoT平台接口获取产品列表
            ListProductsResponse response = ioTDAClient.listProducts(request);

            // 打印完整响应信息
            System.out.println("response: " + response.toString());

            // 获取产品列表数据
            List<ProductSummary> products = response.getProducts();

            // 打印每个产品的概要信息
            System.out.println("products:");
            products.forEach(System.out::println);

        } catch (ConnectionException e) {
            // 处理网络连接异常（如无法连接到IoT平台）
            e.printStackTrace();
        } catch (RequestTimeoutException e) {
            // 处理请求超时异常（如请求长时间未得到响应）
            e.printStackTrace();
        } catch (ServiceResponseException e) {
            // 处理服务端返回的错误响应（如参数错误、权限不足等）
            e.printStackTrace();

            // 打印HTTP状态码（如400、401、500等）
            System.out.println(e.getHttpStatusCode());

            // 打印请求ID（用于服务端日志追踪）
            System.out.println(e.getRequestId());

            // 打印服务错误码（如AUTH_FAILED、INVALID_PARAM等）
            System.out.println(e.getErrorCode());

            // 打印错误信息描述
            System.out.println(e.getErrorMsg());
        }
    }
}