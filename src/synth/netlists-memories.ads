--  Extract memories.
--  Copyright (C) 2019 Tristan Gingold
--
--  This file is part of GHDL.
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
--  MA 02110-1301, USA.

with Netlists.Builders; use Netlists.Builders;

package Netlists.Memories is
   --  Try to convert dyn_insert/dyn_extract to memory ports.
   procedure Extract_Memories2 (Ctxt : Context_Acc; M : Module);

   --  Count the number of memidx in a memory address.
   function Count_Memidx (Addr : Net) return Natural;

   --  True iff a RAM can be infered from VAL (the input of an assignment).
   --  TODO: handle partial write (offset)
   --  TODO: directly check with assignment target.
   function Can_Infere_RAM (Val : Net; Prev_Val : Net) return Boolean;

   --  Transform VAL to a RAM.
   function Infere_RAM (Ctxt : Context_Acc; Val : Net) return Net;
end Netlists.Memories;
