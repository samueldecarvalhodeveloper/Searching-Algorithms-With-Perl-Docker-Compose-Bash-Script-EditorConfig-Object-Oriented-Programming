package main;

use strict;
use warnings FATAL => "all";
use lib "./lib/";
use algorithms::sequential_search::sequential_search_client;
use algorithms::binary_search::binary_search_client;
use algorithms::binary_tree_search::binary_tree_search_client;
use algorithms::b_tree_set::b_tree_set_client;
use algorithms::red_black_binary_search_tree_search::red_black_binary_search_tree_search_client;
use algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_client;
use algorithms::hashing_with_linear_probing::hashing_with_linear_probing_client;

print("Sequential Search:\n\n");

algorithms::sequential_search::sequential_search_client::execute();

print("\n");

print("Binary Search:\n\n");

algorithms::binary_search::binary_search_client::execute();

print("\n");

print("Binary Tree Search:\n\n");

algorithms::binary_tree_search::binary_tree_search_client::execute();

print("\n");

print("B Tree Set:\n\n");

algorithms::b_tree_set::b_tree_set_client::execute();

print("\n");

print("Red Black Binary Search Tree Search:\n\n");

algorithms::red_black_binary_search_tree_search::red_black_binary_search_tree_search_client::execute();

print("\n");

print("Hashing With Separate Chaining:\n\n");

algorithms::hashing_with_separate_chaining::hashing_with_separate_chaining_client::execute();

print("\n");

print("Hashing With Linear Probing:\n\n");

algorithms::hashing_with_linear_probing::hashing_with_linear_probing_client::execute();

1;
