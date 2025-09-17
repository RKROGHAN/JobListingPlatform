package com.jobportal.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "skills")
@Data
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
public class Skill {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank
    @Size(max = 100)
    @Column(name = "name", unique = true)
    private String name;
    
    @Size(max = 500)
    @Column(name = "description")
    private String description;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "category")
    private SkillCategory category;
    
    @Column(name = "is_active")
    private Boolean isActive = true;
    
    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @LastModifiedDate
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @ManyToMany(mappedBy = "skills", fetch = FetchType.LAZY)
    private Set<User> users = new HashSet<>();
    
    @ManyToMany(mappedBy = "requiredSkills", fetch = FetchType.LAZY)
    private Set<Job> jobs = new HashSet<>();
    
    public enum SkillCategory {
        PROGRAMMING_LANGUAGES,
        FRAMEWORKS,
        DATABASES,
        TOOLS,
        SOFT_SKILLS,
        LANGUAGES,
        CERTIFICATIONS,
        OTHER
    }
    
    // Helper methods
    public void addUser(User user) {
        this.users.add(user);
        user.getSkills().add(this);
    }
    
    public void removeUser(User user) {
        this.users.remove(user);
        user.getSkills().remove(this);
    }
}
