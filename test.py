import subprocess


failed = subprocess.call(["pip", "install", "-e", "."])
assert not failed

import genArray
import numpy as np
from matplotlib import pyplot as plt


arr = np.array(genArray.returnArray())

# plot arr histogram

plt.hist(arr, bins=500)
plt.show()


