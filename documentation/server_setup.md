This cover the initial setup and basic configuration of the server. It includes the system update, SSH setup, firewall configuration, and any preliminary steps needed before configuring network services.

### Content:

**System Update:** Update and upgrade server packages.
**SSH Configuration:** Install and enable SSH for remote access.
**Firewall Setup:** Configure UFW to allow SSH, HTTP, and DNS traffic.

### Server Setup (No GUI)

#### 1. **Environment Preparation**
   - **Virtualization**: VMware Fusion
   - **Operating System**: Ubuntu Server

#### 2. **Core Installations**
   - **System Update**:
     ```bash
     sudo apt update && sudo apt upgrade
     ```
   - **SSH**:
     ```bash
     sudo apt install openssh-server
     sudo systemctl enable ssh
     sudo systemctl start ssh
     ```
   - **Firewall (UFW)**:
     ```bash
     sudo apt install ufw
     sudo ufw allow ssh
     sudo ufw allow http
     sudo ufw allow 53    # DNS
     sudo ufw allow 53/udp
     sudo ufw enable

     
### Samba Shared Directory

1. **Install Samba**:
   ```bash
   sudo apt install samba
   ```
2. **Configuration**:
   - Edit `/etc/samba/smb.conf`:
     ```ini
     [shared]
     path = /home/user/shared
     valid users = user
     read only = no
     writable = yes
     ```
3. **Permissions**:
   ```bash
   sudo chown user:user /home/user/shared
   sudo chmod 775 /home/user/shared
   ```
4. **Restart Samba**:
   ```bash
   sudo systemctl restart smbd
   ```
