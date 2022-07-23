#[macro_export]
macro_rules! how_many {
    ($x: expr, $y: expr) => {
        ((($x) + (($y) - 1)) / ($y))
    };
}

#[macro_export]
macro_rules! roundup {
    ($x: expr, $y: expr) => {
        (how_many!($x, $y) * $y)
    };
}
