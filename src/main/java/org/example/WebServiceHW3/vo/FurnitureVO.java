package org.example.WebServiceHW3.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class FurnitureVO {
    int id;
    String name;
    int price;
    int category;
    int width;
    int depth;
    int height;
}
