import earcut_ctfe;
import std.stdio;
import std.typecons;

alias Point = Tuple!(int, int);

static immutable Point[4][3] polygon = [
    [Point(0, 0), Point(0, 200), Point(400, 200), Point(400, 0)], // boundary coords
    [Point(50, 50), Point(50, 150), Point(150, 150), Point(150, 50)], // hole 1
    [Point(250, 50), Point(250, 150), Point(300, 150), Point(300, 50)] // hole 2 ...
];

static immutable earcut = {
    Earcut!(size_t, Point[4][3]) earcut;
    earcut.run(polygon);
    return earcut;
}();

void main()
{
    // earcut.indices is of size_t[] (no runtime allocations at all if it's run at CTFE)
    foreach (ref elem; earcut.indices)
        writeln(elem);
}
