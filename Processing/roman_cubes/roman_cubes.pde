color dark = #003434; // bottom right
color light = #00b3b3; //top
color med = #008080; // bottom left
float radius;
float apothem; // sqrt(3) / 2
int amt_shapes;
int cnt_shapes;

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
    // background mauve to show imperfections
    background(#e6b3cc);
    for (int j = 0; j < cnt_shapes; j++) {
        PVector prev_center = new PVector( -radius, j * apothem);
        for (int i = 0; i < amt_shapes; i++) {
            // if i is even, then the shape is on the bottom
            // if i is odd, then the shape is on the top
            
            // only variable directly dependent on i
            PVector center = new PVector(prev_center.x + 3 * radius / 2,((i + 1) % 2 + 2 * j) * apothem);
            Cube cube = new Cube(center, radius, light, med, dark);
            cube.draw();
            prev_center = new PVector(center.x, center.y);
        }
    }
}

void mousePressed() {
    save("output/output.png");
}