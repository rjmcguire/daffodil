module dil;

public {
    import dil.image;
    import dil.color;
    import dil.pixels;

    static {
        // Image Formats
        import bmp = dil.bmp;

        // Submodules
        import filter = dil.filter;
        import transform = dil.transform;
    }
}

import dil.image;
import dil.pixels;
import dil.misc;

/**
 * Attempt to open an image of arbitrary given a pixel format.
 */
auto open(PixelFmt)(ubyte[] data) {
    if (bmp.isBMP(data)) {
        return bmp.open!PixelFmt(data);
    }
    assert(0);
}
mixin(OpenOverloads);
