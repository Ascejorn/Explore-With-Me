package ru.practicum.ewm.category;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "categories", schema = "public")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, name = "name",length = 128)
    private String name;
}
