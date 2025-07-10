import com.zzyl.common.constant.Constants;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.context.Context;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

/**
 * @Date: 2025/7/10 21:16
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
public class VelocityDemoTest {

    public static void main(String[] args) throws IOException {

        // 1.初始化模版引擎
        Properties properties = new Properties();
        // 表示告诉我们去哪一个类下找对应的模版资源文件
        properties.setProperty("resource.loader.file.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        // 定义字符集
        properties.setProperty(Velocity.INPUT_ENCODING, Constants.UTF8);
        Velocity.init(properties);
        // 2.获取对应的模版文件
        Template template = Velocity.getTemplate("vms/index.html.vm", Constants.UTF8);
        // 3.指定输出位置
        FileWriter fileWriter = new FileWriter("zzyl-generator\\src\\main\\resources\\index.html");
        /**
         *  4.合并模版和数据
         *  context:数据
         *  template:模版
         *  fileWriter:输出位置
         */
        Context context = new VelocityContext();
        context.put("message", "Adrian");
        template.merge(context, fileWriter);

        // 5.关闭流
        fileWriter.close();
    }
}