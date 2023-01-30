FROM archlinux
COPY run.sh /
RUN pacman -Syu --noconfirm cups inotify-tools
RUN chmod +x run.sh
VOLUME /var/to-print /etc/cups
CMD /run.sh
