python
import sys
sys.path.insert(0, '/home/stanislas/profiles/default-x86_64-linux-ubuntu-13.04/src/third-party/eigen3.2.2/debug/gdb')
from printers import register_eigen_printers
register_eigen_printers (None)
end
