module testbmp;

import daffodil;
import bmp = daffodil.bmp;
import unit_threaded;

@("fails on empty file")
unittest {
    shouldThrow!(ImageException)(
        bmp.load!8("test/images/empty.file")
    );
}

@("load BMP meta data")
unittest {
    auto meta = loadMeta("test/images/bmp_small-24bpp.bmp");
    assert(meta !is null);
    assert(meta.width);
    assert(meta.height);
    assert(cast(bmp.BmpMetaData)meta);
}

@("load BMP image data")
unittest {
    auto image = load!8("test/images/bmp_small-24bpp.bmp");
    assert(image !is null);
    assert(image.width == 41);
    assert(image.height == 45);
    assert(image[10, 10] == [  0,   0, 255]);
    assert(image[30, 10] == [  0, 255,   0]);
    assert(image[10, 30] == [255,   0,   0]);
    assert(image[30, 30] == [255, 255, 255]);
}