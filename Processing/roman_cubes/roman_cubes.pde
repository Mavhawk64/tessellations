// color dark = #003434; // bottom right
// color light = #00b3b3; //top
// color med = #008080; // bottom left
color dark = #000000; // bottom right
color light = #444444; //top
color med = #222222; // bottom left
// color dark = #9d8400; // bottom right
// color light = #ffe976; //top
// color med = #ffd700; // bottom left
float radius;
float apothem;
int amt_shapes;
int cnt_shapes;
float angle_offset = 0;
// float screen_offset = PI / 2;

void setup() {
    // size(600,600);
    // fullScreen();
    // 8k
    size(7680, 4320);
    
    // amt_shapes = ceil(width / radius);
    amt_shapes = 30;
    radius = width / amt_shapes;
    apothem = radius * sqrt(3) / 2;
    cnt_shapes = ceil(height / radius);
}

void draw() {
    //rotate(screen_offset);
    // background mauve to show imperfections
    // background(#e6b3cc);
     background(#333333);
    // background cpu chip green
    //background(#00b300);
    
    for (int i = 0; i < amt_shapes; i++) {
        for (int j = 0; j < cnt_shapes; j++) {
            // if i is even, then the shape is on the bottom
            // if i is odd, then the shape is on the top
            
            // only variable directly dependent on i
            PVector center = new PVector(i * 3 * radius / 2,((i + 1) % 2 + 2 * j) * apothem);
            Cube cube = new Cube(center, radius, light, med, dark, angle_offset);
            cube.draw();
        }
    }
}

void mousePressed() {
    save("output/output.png");
}
