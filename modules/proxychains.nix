{ pkgs, ... }:
{
  programs.proxychains = {
    enable = true;
    localnet = "127.0.0.0/255.0.0.0";
    package = pkgs.proxychains;
    proxies = {
      singapore1 = {
        type = "https";
        host = "104.248.98.31";
        port = 3128;
      };
    };
    proxyDNS = true;
    quietMode = true;
    remoteDNSSubnet = 224;
    tcpConnectTimeOut = 8000;
    tcpReadTimeOut = 15000;
  };
}
