<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>

  <alias>
   <family>Hack Nerd Font</family>
   <prefer>
    <family>Hack Nerd Font</family>
    <family>Font Awesome 6 Pro</family>
    <family>Font Awesome 6 Brands</family>
    <family>Font Awesome 6 Duotone</family>
   </prefer>
  </alias>

  <alias>
   <family>Cantarell</family>
   <prefer>
    <family>SF Pro Display</family>
   </prefer>
  </alias>

  <match target="font">
    <edit name="antialias" mode="assign">
      <bool>true</bool>
    </edit>
  </match>

  <match target="font">
    <edit name="hinting" mode="assign">
      <bool>false</bool>
    </edit>
  </match>

  <match target="font">
    <edit name="hintstyle" mode="assign">
      <const>hintfull</const>
    </edit>
  </match>

  <match target="font">
    <edit name="rgba" mode="assign">
      <const>rgb</const>
    </edit>
  </match>

</fontconfig>

