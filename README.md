# JDeploy
JDeploy自动化部署平台

JDeploy是Java + Shell实现的基于Linux系统的自动化、可视化的项目部署平台，能部署Java服务、Java Web项目，可以简化项目部署操作，无需繁琐的黑窗口SSH指令及Jenkins复杂的配置。

![JDeploy](http://img.blog.csdn.net/20151020104553172)

![JDeploy](http://img.blog.csdn.net/20151020104628193)

![JDeploy](http://img.blog.csdn.net/20151020104709833)

![JDeploy](http://img.blog.csdn.net/20151020105031597)

## JDeploy自动化部署平台部署

服务器环境：Linux（不支持Windows），需要Java环境和Maven环境，支持`java`和`mvn`命令。

### 创建数据库（MySQL）
运行SQL文件创建数据库：doc/sql.sql

### Shell脚本
JDeploy自动化部署平台是基于Shell脚本实现。

Java项目部署Shell脚本：doc/shell/javadeploy

Java Web项目部署Shell脚本：doc/shell/javawebdeploy

Shell脚本的目录位置需要配置在`config.properties`中。

### Jetty
JDeploy自动化部署平台Java Web项目部署是基于Jetty服务器的。

需要自行下载Jetty服务器，并在`config.properties`中配置Jetty目录下start.jar路径。

### 配置文件
配置文件：src/main/resources/config.properties

需要配置数据库连接信息、Shell脚本位置、Jetty位置、项目部署位置。

### 部署
以上配置完成后，将项目部署在Jetty/Tomcat服务器上即可。

## Java项目部署
### 新建项目
在“Java项目部署”选项中点击“创建”按钮，进入创建页面。需要填写“项目名称”、“finalName”、“SVN地址”，例如：

项目名称：JDeploy测试Java项目

finalName：javadeploy

SVN地址：http://code.taobao.org/svn/jdploy_java_deploy_test/

注：finalName需要填写部署的项目pom.xml中配置的finalName，如`<finalName>javadeploy</finalName>`


### 部署项目
在项目详情页面点击“部署”按钮，会从SVN中检出最新版本代码，并打包运行。

### 重启和停止
如果项目已经完成部署，可以通过点击“重启”或者“停止”按钮来重启或停止。

### 查看运行状态和显示日志
可在“运行状态”面板中查看程序运行状态，点击“查看日志”可以查看程序在控制台输入的日志。

### 对Java项目要求
DEMO：http://code.taobao.org/svn/jdploy_java_deploy_test/

1、使用Maven管理项目，通过`mvn clean package`可以打可运行的jar包，创建项目时填写的finalName和pom.xml中的finalName一致。

2、jar包可以通过`java -jar xxx.jar`直接运行（包含依赖包，并配置好main方法所在Class）。

建议使用maven-shade-plugin插件：
```
<plugin>
	<groupId>org.apache.maven.plugins</groupId>
	<artifactId>maven-shade-plugin</artifactId>
	<version>2.3</version>
	<executions>
		<execution>
			<phase>package</phase>
			<goals>
				<goal>shade</goal>
			</goals>
			<configuration>
				<transformers>
					<transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
						<mainClass>com.xxg.jdeploy.test.javadeploy.Main</mainClass>
					</transformer>
					<transformer implementation="org.apache.maven.plugins.shade.resource.AppendingTransformer">
						<resource>META-INF/spring.handlers</resource>
					</transformer>
					<transformer implementation="org.apache.maven.plugins.shade.resource.AppendingTransformer">
						<resource>META-INF/spring.schemas</resource>
					</transformer>
				</transformers>
			</configuration>
		</execution>
	</executions>
</plugin>
```

## Java Web项目部署
### 新建项目
在“Java Web项目部署”选项中点击“创建”按钮，进入创建页面。需要填写“项目名称”、“finalName”、“contextPath”、“端口号”、“SVN地址”，例如：

项目名称：JDeploy测试Java Web项目

finalName：javawebdeploy

contextPath：/jdploytest（也可以填写'/'）

端口号：8080

SVN地址：http://code.taobao.org/svn/jdploy_javaweb_deploy_test/

注：finalName需要填写部署的项目pom.xml中配置的finalName，如`<finalName>javawebdeploy</finalName>`

### 部署项目
在项目详情页面点击“部署”按钮，会从SVN中检出最新版本代码，并打包运行。

### 重启和停止
如果项目已经完成部署，可以通过点击“重启”或者“停止”按钮来重启或停止。

### 查看运行状态和显示日志
可在“运行状态”面板中查看程序运行状态，点击“查看日志”可以查看程序在控制台输入的日志。可用浏览器访问http://ip:port/contextPath。

### 对Java Web项目要求
DEMO：http://code.taobao.org/svn/jdploy_javaweb_deploy_test/

使用Maven管理项目，通过`mvn clean package`可以打成war包，创建项目时填写的finalName和pom.xml中的finalName一致。
