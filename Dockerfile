# 基础镜像
FROM alpine:latest

# 作者信息
LABEL maintainer="𝑬𝓷𝒅𝒆 ℵ"

# 工作目录
WORKDIR /root

# 将 shellcrash.sh 文件添加到镜像中的 /root 目录
ADD shellcrash.sh /root/shellcrash.sh

# 设置脚本的可执行权限
RUN chmod +x /root/shellcrash.sh

# 修改系统时间
RUN apk add --no-cache curl wget tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo Asia/Shanghai > /etc/timezone \
    && apk del tzdata
# 安装软件
RUN wget https://raw.githubusercontent.com/juewuy/ShellCrash/master/install.sh && (echo "1"; sleep 2; echo "2"; sleep 2; echo "1"; sleep 2; echo "1") | sh install.sh \
    && source /etc/profile &> /dev/null && (echo "2"; sleep 2; echo "0"; sleep 2; echo "1"; sleep 2; echo "1"; sleep 2; echo "2"; sleep 2; echo "1"; sleep 2; echo "https://suo.yt/AhfmRc1"; sleep 2; echo "1"; sleep 5; echo "1"; sleep 5; echo "0") | /etc/ShellCrash/menu.sh && mv /etc/ShellCrash /etc/ShellCrash_bak && mkdir /etc/ShellCrash

# 映射端口
EXPOSE map[7890/tcp:{}]
EXPOSE map[9999/tcp:{}]

# 设置挂载点
VOLUME ["/etc/ShellCrash"]

# 设置环境变量
ENV ENV="/etc/profile"

#启动命令
ENTRYPOINT ["sh","shellcrash.sh"]
