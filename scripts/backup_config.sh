#### 4. **Backup Automation**
   - **Backup Script (Cron)**:
     Create a backup script:
     ```bash
     sudo nano /usr/local/bin/backup_config.sh
     ```
     Add to the script:
     ```bash
     #!/bin/bash
     tar -czvf /backup/config_backup_$(date +%F).tar.gz /etc/nginx /etc/bind /etc/dhcp
     ```
     Make the script executable:
     ```bash
     sudo chmod +x /usr/local/bin/backup_config.sh
     ```
     Set up a cron job:
     ```bash
     sudo crontab -e
     ```
     Add:
     ```plaintext
     0 3 * * 0 /usr/local/bin/backup_config.sh
     ```
