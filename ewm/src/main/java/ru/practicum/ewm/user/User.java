package ru.practicum.ewm.user;


import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "users", schema = "public")
@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, name = "name", length = 200)
    private String name;

    @Column(nullable = false, unique = true, name = "email", length = 200)
    private String email;
}
