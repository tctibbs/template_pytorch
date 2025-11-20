"""Example tests for ``pytorch_template``."""

from pytorch_template import add


def test_add_returns_sum() -> None:
    """Test that add function returns the correct sum of two integers."""
    # Arrange
    left = 2
    right = 3

    # Act
    result = add(left, right)

    # Assert
    assert result == 5
