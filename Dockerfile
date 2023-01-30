FROM archlinux
RUN pacman -Syu --noconfirm cups inotify-tools
VOLUME /var/to-print /etc/cups
COPY run.sh /run.sh
CMD /run.sh