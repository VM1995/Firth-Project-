package dao;

import entity.Faculty;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacultyDAO extends JpaRepository<Faculty, Long> {

    List<Faculty> findAllByUniversityId(Long university_id);
}
