{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mold
    gcc13
    jdk21
    unstable.gradle
    dioxus-cli
    #surrealdb
    #surrealdb-migrations
    #surrealist
    blockbench
  ];
}
