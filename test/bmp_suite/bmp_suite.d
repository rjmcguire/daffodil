module bmp_suite.bmp_suite;

import std.file;
import std.format;

import unit_threaded;
import daffodil;

@ShouldFail
@("pal1bg.bmp", "pal1wb.bmp", "pal4gs.bmp", "pal8-0.bmp", "pal8gs.bmp",
  "pal8os2.bmp", "pal8topdown.bmp", "pal8v5.bmp", "pal8w125.bmp", "rgb32bf.bmp",
  "rgb16-565.bmp", "rgb16.bmp", "rgb24pal.bmp", "rgb32.bmp", "pal1.bmp",
  "pal4.bmp", "pal4rle.bmp", "pal8.bmp", "pal8nonsquare.bmp", "pal8rle.bmp",
  "pal8v4.bmp", "pal8w124.bmp", "pal8w126.bmp", "rgb16-565pal.bmp")
void testGoodBMPImagesFail(string fileName) {
    testGoodBMPImages(fileName);
}

@("rgb24.bmp")
void testGoodBMPImages(string fileName) {
    auto image = load!Pixel24Bpp("test/bmp_suite/g/" ~ fileName);
    assert(image !is null);
}

@("badbitcount.bmp", "baddens1.bmp", "badfilesize.bmp", "badpalettesize.bmp",
  "badrle4bis.bmp", "badrle4ter.bmp", "badrle.bmp", "badwidth.bmp",
  "reallybig.bmp", "rletopdown.bmp", "badbitssize.bmp", "baddens2.bmp",
  "badheadersize.bmp", "badplanes.bmp", "badrle4.bmp", "badrlebis.bmp",
  "badrleter.bmp", "pal8badindex.bmp", "rgb16-880.bmp", "shortfile.bmp")
void testBadBMPImages(string fileName) {
    shouldThrow!(ImageException)(
        load!Pixel24Bpp("test/bmp_suite/b/" ~ fileName)
    );
}

@("pal1p1.bmp", "pal4rlecut.bmp", "pal8os2sp.bmp", "pal8os2v2-40sz.bmp",
  "pal8oversizepal.bmp", "rgb16-231.bmp", "rgb24largepal.bmp", "rgb24prof.bmp",
  "rgb32fakealpha.bmp", "rgba16-4444.bmp", "rgba32abf.bmp", "rgba32h56.bmp",
  "pal4rletrns.bmp", "pal8os2-sz.bmp", "pal8os2v2.bmp", "pal8rlecut.bmp",
  "rgb16-3103.bmp", "rgb24lprof.bmp", "rgb32-111110.bmp", "rgb32h52.bmp",
  "rgba32-61754.bmp", "rgba32.bmp", "pal2color.bmp", "pal8offs.bmp", "pal2.bmp",
  "pal8os2v2-16.bmp", "pal8os2v2-sz.bmp", "pal8rletrns.bmp", "rgb24jpeg.bmp",
  "rgb24png.bmp", "rgb32-7187.bmp", "rgba16-1924.bmp", "rgba32-81284.bmp")
void testQuestionableBMPImages(string fileName) {
    try {
        auto image = load!Pixel24Bpp("test/bmp_suite/q/" ~ fileName);
        assert(image !is null);
    } catch (ImageException e) {
        assert(true);
    }
}