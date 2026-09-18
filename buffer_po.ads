--  Ada 2022 topic: protected entries with barriers (bounded buffer).
pragma Ada_2022;

package Buffer_PO is

   Capacity : constant := 4;

   type Store is array (1 .. Capacity) of Integer;

   protected type Buffer is
      entry Put (Item : Integer);
      entry Get (Item : out Integer);
      function Length return Natural;
   private
      Data  : Store;
      Count : Natural := 0;
      In_I  : Positive := 1;
      Out_I : Positive := 1;
   end Buffer;

end Buffer_PO;
