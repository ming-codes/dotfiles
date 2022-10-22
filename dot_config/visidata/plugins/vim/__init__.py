
from visidata import Sheet, BaseSheet, Canvas, TableSheet, vd

from .setup import unbind_all_keys

from .motion import *
from .edit import *
from .clipboard import *
from .select import *

unbind_all_keys()

motion.unbindKeys()
edit.unbindKeys()
clipboard.unbindKeys()
select.unbindKeys()

motion.bindKeys()
edit.bindKeys()
clipboard.bindKeys()
select.bindKeys()

#vd.allPrefixes = ['^[']

TableSheet.unbindkey(':');
TableSheet.unbindkey(';');
TableSheet.unbindkey('Space');

TableSheet.bindkey(':', 'exec-python')
