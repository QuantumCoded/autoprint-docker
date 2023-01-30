FROM archlinux
COPY run.sh /
RUN pacman -Syu --noconfirm cups inotify-tools
VOLUME /var/to-print /etc/cups
CMD bash run.sh
