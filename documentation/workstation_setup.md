This is instructions for setting up the workstation, including application installations and configurations for network connectivity and remote support.

### Content:

**System Update:** Update and upgrade workstation packages.
**Application Installation:** Install LibreOffice, GIMP, and Mullvad Browser.
**Automatic IP Addressing:** Verify that DHCP is enabled for the workstation.
**Remote Support Option (VNC):** Configure VNC for remote support by installing a VNC viewer.
### Workstation Setup (GUI with Applications)

#### 1. **System Preparation**
   - **OS Installation**: Ubuntu Desktop on a VM.
   - **System Update**:
     ```bash
     sudo apt update && sudo apt upgrade
     ```

#### 2. **Application Installation**
   - **LibreOffice**:
     ```bash
     sudo apt install libreoffice
     ```
   - **GIMP**:
     ```bash
     sudo apt install gimp
     ```
   - **Mullvad Browser**:
     Download and install from the [Mullvad site](https://mullvad.net/en/download/browser).

#### 3. **Configuration**
   - **Automatic IP Addressing**: DHCP is enabled by default on Ubuntu Desktop.
   - **Partitioning**: Set up a separate partition for `/home`.

#### 4. **Remote Support Option (VNC)**
   - **VNC Server on Server**:
     ```bash
     sudo apt install tightvncserver
     ```
     Start VNC on the server:
     ```bash
     tightvncserver :1
     ```
   - **VNC Viewer on Workstation**: Install RealVNC Viewer for remote access.
