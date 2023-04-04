"""Example module."""


def check_if_in_list(a: int, b: list[int]) -> bool:
    """Check whether an int a is in an integer list b.

    Parameters
    ----------
    a : int
        Integer to test.
    b : list[int]
        List to use when testing a.

    Returns
    -------
    bool
        True if a is in b, False otherwise.
    """
    return a in b


def func(a: int, b: str) -> str:
    return 3
