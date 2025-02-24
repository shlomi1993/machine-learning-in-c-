#pragma once

#include <vector>
#include <cstdint>
#include <memory>

class Data {
    std::vector<uint8_t> *feature_vector; // No class at end
    std::vector<double> *normalized_feature_vector; // For DNN models
    std::vector<int> *class_vector; // For DNN models
    uint8_t label;
    uint8_t enum_label; // A -> 1, B -> 2
    double distance;

public:
    Data();
    ~Data();
    void set_feature_vector(std::vector<uint8_t> *feature_vector);
    void append_to_feature_vector(uint8_t value);
    void set_normalized_feature_vector(std::vector<double> *feature_vector); // For DNN models
    void append_to_normalized_feature_vector(double value); // For DNN models
    void set_class_vector(int count);
    void set_label(uint8_t label);
    void set_enumerated_label(int enum_label);

    size_t get_feature_vector_size() const;
    uint8_t get_label() const;
    uint8_t get_enumerated_label() const;
    void set_distance(double distance);

    std::vector<uint8_t> *get_feature_vector();
    std::vector<double> *get_normalized_feature_vector(); // For DNN models
    std::vector<int> get_class_vector(); // For DNN models
    double get_distance() const;
};