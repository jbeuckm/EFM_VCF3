translate([0,0,2]) rotate([180]) EuroPanel("VCF3", 8);

  font = ".SF Compact Display:style=Bold";
  labelFontSize = 7;
  
  /*
  in jack 5.26
level 19.12
cv 33.22
cv le 47.08
Q 63.57
F 80.18
out 94.16
  */

module EuroPanel(label, hp) {

  sideOffset = 18;
  panelWidth = hp*5.08;

//  translate([panelWidth,0,0]) scale([-1,1,1]) Support();
  Support();
  
  
  difference() {
    cube([hp*5.08, 128.5, 3]);
      
    translate([2,118,2])  {
        linear_extrude(height=2, convexity=4) text(label, size=9, font=font);
    }
    translate([7.5,3]) MountingHole();
    translate([panelWidth - 7.5, 128.5 - 3]) MountingHole();

    translate ([sideOffset, 113, 0]) union() {
        translate([0,-94.16,0]) JackHole();
        translate([0,-80.18,0]) KnobHole();
        translate([0,-63.57,0]) KnobHole();
        translate([0,-47.08,0]) KnobHole();
        translate([0,-33.22,0]) JackHole();
        translate([0,-19.12,0]) KnobHole();
        translate([0,-5.26,0]) JackHole();
    }
    translate([16,109.5,2]) {
        label("in",-5.26);
        label("",-19.12);
        label("cv",-33.22);
        label("",-58.42);
        label("Q",-63.57);
        label("F",-80.18);
        label("out",-94.16);
    }


  }

}

module label(text, y){
      translate([0,y])   {
          linear_extrude(height=2, convexity=4) text(text, size=labelFontSize, font=font, halign="right");
      }
}

module KnobHole() { translate([12.5,0,-.5]) cylinder(h=4, d=8, $fn=12); }

module JackHole() { translate([6,0,-.5]) cylinder(h=4, d=6.5, $fn=12); }

module LEDHole() { translate([10,0,-.5]) cylinder(h=4, d=5.3, $fn=12); }

module MIDIHole() { translate([10.5,0,-.5]) cylinder(h=4, d=18.5, $fn=24); }

module Support() {
    translate([0,10,0])
    rotate([-90,0,0])
  linear_extrude(108.5)
    polygon([[0,0], [0,2], [1.5,5], [3,5], [3,0]]);
}


module MountingHole() {
  hull() {
    translate([-2,0,-.5]) cylinder(h=4, r=1.6, $fn=12);
    translate([2,0,-.5]) cylinder(h=4, r=1.6, $fn=12);
  }
}

echo(version=version());
