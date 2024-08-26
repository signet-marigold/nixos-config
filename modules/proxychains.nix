{
  programs.proxychains = {
    enable = true;
    localnet = "127.0.0.0/255.0.0.0";
    package = proxychains-ng;
    proxies = {
      myproxy = {
        type = "socks4";
        host = "127.0.0.1";
        port = 1337;
      };
    };
    proxyDNS = true;
    quietMode = true;
    remoteDNSSubnet = 224;
    tcpConnectTimeOut = 8000;
    tcpReadTimeOut = 15000;
  };
}
