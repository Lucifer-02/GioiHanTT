from setuptools import setup, Extension
from builder import ZigBuilder

genArray = Extension("genArray", sources=["genArrayModule.zig"])

setup(
    name="genArray",
    version="0.0.1",
    description="gen random array in Zig",
    ext_modules=[genArray],
    cmdclass={"build_ext": ZigBuilder},
)
