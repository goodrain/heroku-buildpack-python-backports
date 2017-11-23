# Heroku buildpack for Python![Build Status](https://travis-ci.org/heroku/heroku-buildpack-python.svg?branch=master)

云帮 Python 语言项目的源码构建核心部分是基于[Heroku buildpack for Python](https://github.com/heroku/heroku-buildpack-python) 来实现的。支持使用`Django`或`Flask`等框架。

## 工作原理

当buildpack检测到您代码的根目录下存在`requirements.txt`文件，该应用被识别为Python应用。Python由pip与其他依赖驱动。Web应用需要绑定到`$PORT`。

## 文档

以下文章了解更多：

- [云帮支持Python](http://www.rainbond.com/docs/stable/user-lang-docs/python/lang-python-overview.html#build)


## 配置

### 指定一个Python版本

新创建的 Python 应用默认使用 2.7.13 版本，您也可以在根目录下创建一个 `runtime.txt`文件来指定版本：

```
cat runtime.txt
python-3.4.3
```

### 推荐使用的Python版本

`Python-2.7.9`~`Python-2.7.13`、`Python-3.4.3`、`Python-3.5.2`、`Python-3.6.0`、`Python-3.6.1`

## 授权

根据 MIT 授权获得许可。 请参阅LICENSE文件
