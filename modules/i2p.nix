{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.i2p ];
  services.i2p.enable = true;

  services.i2pd = {
    enable = true;

    addressbook.defaulturl = "http://joajgazyztfssty4w2on5oaqksz6tqoxbduy553y34mf4byv6gpq.b32.i2p/export/alive-hosts.txt";
    addressbook.subscriptions = [
      "http://inr.i2p/export/alive-hosts.txt"
      "http://i2p-projekt.i2p/hosts.txt"
      "http://stats.i2p/cgi-bin/newhosts.txt"
    ];
    exploratory.inbound.length = 3;
    exploratory.inbound.quantity = 5;
    exploratory.outbound.length = 3;
    exploratory.outbound.quantity = 5;
    limits.coreSize = 0;
    limits.ntcpHard = 0;
    limits.ntcpSoft = 0;
    limits.ntcpThreads = 1;
    limits.openFiles = 0;
    limits.transittunnels = 4500;
    ntcp2.enable = true;
    ntcp2.port = 0;
    ntcp2.published = false;
    precomputation.elgamal = true;

    proto.http = {
      enable = true;
      address = "127.0.0.1";
      auth = false;
      hostname = null;
      name = "http";
      pass = "i2pd";
      port = 7070;
      strictHeaders = null;
      user = "i2pd";
    };

    proto.socksProxy = {
      enable = true;
      address = "127.0.0.1";
      keys = "socksproxy-keys.dat";
      name = "socksproxy";
      outproxy = "127.0.0.1";
      outproxyEnable = false;
      outproxyPort = 4444;
      port = 4447;
      inbound.length = 3;
      inbound.quantity = 5;
      outbound.length = 3;
      outbound.quantity = 5;
      latency.max = null;
      latency.min = null;
    };

    proto.bob = {
      enable = false;
      address = "127.0.0.1";
      name = "bob";
      port = 2827;
    };

    proto.sam = {
      enable = true;
      address = "127.0.0.1";
      name = "sam";
      port = 7656;
    };

    proto.i2cp = {
      enable = true;
      address = "127.0.0.1";
      name = "i2cp";
      port = 7654;
    };

    proto.i2pControl = {
      enable = true;
      address = "127.0.0.1";
      name = "i2pcontrol";
      port = 7650;
    };
  };
}
