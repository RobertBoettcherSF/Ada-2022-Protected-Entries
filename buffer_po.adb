pragma Ada_2022;

package body Buffer_PO is

   protected body Buffer is

      entry Put (Item : Integer) when Count < Capacity is
      begin
         Data (In_I) := Item;
         In_I := (if In_I = Capacity then 1 else In_I + 1);
         Count := Count + 1;
      end Put;

      entry Get (Item : out Integer) when Count > 0 is
      begin
         Item := Data (Out_I);
         Out_I := (if Out_I = Capacity then 1 else Out_I + 1);
         Count := Count - 1;
      end Get;

      function Length return Natural is
      begin
         return Count;
      end Length;

   end Buffer;

end Buffer_PO;
