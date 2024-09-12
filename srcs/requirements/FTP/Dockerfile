FROM debian:bullseye

RUN apt update
RUN apt install -y vsftpd
RUN mkdir -p /var/run/vsftpd/empty

# Add FTP configuration file
COPY conf/vsftpd.conf /etc/vsftpd.conf

# Add script to create FTP user
COPY tools/create_ftp_user.sh /usr/local/bin/create_ftp_user.sh
RUN chmod +x /usr/local/bin/create_ftp_user.sh

# Expose FTP ports
EXPOSE 20 21 21100-21110

# Run vsftpd
CMD ["/usr/local/bin/create_ftp_user.sh"]