library verilog;
use verilog.vl_types.all;
entity sign_extender is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end sign_extender;