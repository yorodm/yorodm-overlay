self: super: {
  rofi-scripts = super.callPackage ./pkgs/rofi-scripts { };
  st = super.st.overrideAttrs ( _ : {
    src = super.fetchgit {
      url = "https://gitea.efym.net/tw1zr/st.git";
      rev= "e763f4ce3ccf6df5b462dcbf433e79fde59a444b";
      sha256="1gw7jlxh49h5r5mr6almxi59n7fwmq2szrjif9ikh32xvjxz15lc";
    };
  });
}
