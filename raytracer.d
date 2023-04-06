import std.math;
import std.stdio;
import std.range;

struct Vector {
    double x, y, z;
    double length() const { return sqrt(x*x + y*y + z*z); }
    Vector unit() const { return this / length(); }
    Vector operator/(double s) const { return Vector(x/s, y/s, z/s); }
    Vector operator*(double s) const { return Vector(x*s, y*s, z*s); }
    Vector operator+(Vector v) const { return Vector(x+v.x, y+v.y, z+v.z); }
    Vector operator-(Vector v) const { return Vector(x-v.x, y-v.y, z-v.z); }
    double operator*(Vector v) const { return x*v.x + y*v.y + z*v.z; }
    Vector operator%(Vector v) const { return Vector(y*v.z - z*v.y, z*v.x - x*v.z, x*v.y - y*v.x); }
}

struct Object {
    Vector pos;
    double radius;
    double specular, reflective;
    Vector color;
    double intersect(Ray ray) const {
        Vector op = pos - ray.origin;
        double b = op * ray.direction;
        double det = b*b - op * op + radius*radius;
        if (det < 0) return 0;
        det = sqrt(det);
        double t;
        if ((t = b - det) > 1e-6) return t;
        if ((t = b + det) > 1e-6) return t;
        return 0;
    }
    Vector normal(Vector point) const { return (point - pos).unit(); }
};

struct Ray {
    Vector origin, direction;
    Vector traverse(double t) const { return origin + direction*t; }
};

void main() {
    int width = 640, height = 480;
    Vector cam_pos = Vector(0, 0, -3), screen_pos = Vector(-1.5, -1, 0), screen_up = Vector(0, 2, 0), screen_right = Vector(4.5, 0, 0);
    Object[] objects = [
        Object(Vector(0, -1e5 - 1, 0), 1e5, 0, 0.2, Vector(0.75, 0.75, 0.75)),
        Object(Vector(0, 0, 2), 1, 1, 0.5, Vector(1, 0, 0)),
        Object(Vector(2, 0, 0), 1, 1, 0.5, Vector(0, 1, 0)),
        Object(Vector(-2, 0, 0), 1, 1, 0.5, Vector(0, 0, 1))
    ];

    writeln("P3\n", width, " ", height, "\n255");
    foreach (y; 0..height) {
        foreach (x; 0..width) {
            Vector color = Vector(0, 0, 0);
            foreach (i; 0..16) {
                double dx = uniform(-0.25, 0.25), dy = uniform(-0.25, 0.25);
                Vector ray_dir = (screen_pos + (screen_right*(x+dx)/width) + (screen_up*(y+dy)/height
