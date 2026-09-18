pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Buffer_PO;

procedure Tests is
   B : Buffer_PO.Buffer;
   X : Integer;

   task type Getter is
      entry Done (Value : out Integer);
   end Getter;

   task body Getter is
      V : Integer;
   begin
      B.Get (V);  -- blocks until Put happens if empty
      accept Done (Value : out Integer) do
         Value := V;
      end Done;
   end Getter;

begin
   --  Sequential path
   B.Put (11);
   B.Put (22);
   Assert (B.Length = 2);
   B.Get (X);
   Assert (X = 11);
   B.Get (X);
   Assert (X = 22);
   Assert (B.Length = 0);
   Put_Line ("PASS Put/Get with barriers (sequential)");

   --  Barrier wake-up: start getter first on empty buffer
   declare
      G : Getter;
      V : Integer;
   begin
      delay 0.05;  -- give Getter time to block in Get
      B.Put (99);
      G.Done (V);
      Assert (V = 99);
   end;
   Put_Line ("PASS entry barrier unblocks waiting Get");

   Put_Line ("All Protected Entries topic tests passed.");
end Tests;
