const py = @cImport({
    @cDefine("PY_SSIZE_T_CLEAN", {});
    @cInclude("Python.h");
});
const gen = @import("src/main.zig");
const std = @import("std");
const math = std.math;

const print = @import("std").debug.print;
const PyObject = py.PyObject;
const PyMethodDef = py.PyMethodDef;
const PyModuleDef = py.PyModuleDef;
const PyModuleDef_Base = py.PyModuleDef_Base;
const Py_BuildValue = py.Py_BuildValue;
const PyModule_Create = py.PyModule_Create;
const METH_NOARGS = py.METH_NOARGS;
const PyArg_ParseTuple = py.PyArg_ParseTuple;
const PyLong_FromLong = py.PyLong_FromLong;
const PyList_Append = py.PyList_Append;
const PyTuple_Append = py.PyTuple_Append;

fn returnArray(self: [*c]PyObject, args: [*c]PyObject) callconv(.C) [*]PyObject {
    _ = self;
    _ = args;

    var list: [*c]PyObject = py.PyList_New(0);

    const sample = gen.gen();

    for (sample) |item| {
        _ = PyList_Append(list, PyLong_FromLong(item));
    }
    return list;
}

fn returnArrayWithInput(self: [*c]PyObject, args: [*c]PyObject) callconv(.C) [*]PyObject {
    _ = self;

    var N: u32 = undefined;
    if (!(py._PyArg_ParseTuple_SizeT(args, "l", &N) != 0)) return Py_BuildValue("");
    var tuple: [*c]PyObject = py.PyTuple_New(N);

    var a: i16 = undefined;
    var b: i16 = undefined;
    var c: i16 = undefined;
    var d: i16 = undefined;
    var e: i16 = undefined;
    var f: i16 = undefined;
    var g: i16 = undefined;

    var y: i64 = undefined;

    var rndGen = std.rand.DefaultPrng.init(42);

    var i: u32 = 0;
    while (i < N) : (i += 1) {
        a = rndGen.random().int(i16);
        b = rndGen.random().int(i16);
        c = rndGen.random().int(i16);
        d = rndGen.random().int(i16);
        e = rndGen.random().int(i16);
        f = rndGen.random().int(i16);
        g = rndGen.random().int(i16);

        y = @as(i64, a) + 2 * b - 12 * c + 155 + 5 * d + @floatToInt(i64, math.tan(@intToFloat(f16, e))) + (f - g) * 9;

        const python_int: [*c]PyObject = Py_BuildValue("i", y);
        _ = py.PyTuple_SetItem(tuple, i, python_int);
    }
    return tuple;
}

var Methods = [_]PyMethodDef{
    PyMethodDef{
        .ml_name = "returnArray",
        .ml_meth = returnArray,
        .ml_flags = METH_NOARGS,
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = "returnArrayWithInput",
        .ml_meth = returnArrayWithInput,
        .ml_flags = @as(c_int, 1),
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = null,
        .ml_meth = null,
        .ml_flags = 0,
        .ml_doc = null,
    },
};

var module = PyModuleDef{
    .m_base = PyModuleDef_Base{
        .ob_base = PyObject{
            .ob_refcnt = 1,
            .ob_type = null,
        },
        .m_init = null,
        .m_index = 0,
        .m_copy = null,
    },
    .m_name = "genArray",
    .m_doc = null,
    .m_size = -1,
    .m_methods = &Methods,
    .m_slots = null,
    .m_traverse = null,
    .m_clear = null,
    .m_free = null,
};

pub export fn PyInit_genArray() [*]PyObject {
    return PyModule_Create(&module);
}
