#!/usr/bin/env python

import fileinput
from collections import defaultdict
import matplotlib.pyplot as plt
import numpy as np

stats = defaultdict(int)
cmap = plt.get_cmap('viridis')

fig, ax = plt.subplots(1, 1, figsize=(10, 8))


fromstdin = False
with fileinput.input() as finput:
    for line in finput:
        if not fromstdin and fileinput.isstdin():
            fromstdin = True
        ext, loc = line.split(' ')
        stats[ext] += int(loc)
        sorted_stats = {k: v for k, v in sorted(stats.items(), key=lambda item: item[1])}
        max_val = max(sorted_stats.values())
        colors = [cmap(val / max_val) for val in sorted_stats.values()]
        y_pos = np.arange(len(sorted_stats))
        ax.clear()
        ax.barh(y_pos, sorted_stats.values(), color=colors)
        ax.set_yticks(y_pos, labels=sorted_stats.keys())
        plt.pause(0.1)

if fromstdin:
    for k, v in sorted_stats.items():
        print(f'{k}\t{v}')
else:
    plt.show()

